/**
 * Modified From
 * https://wiki.openssl.org/index.php/EVP_Symmetric_Encryption_and_Decryption
 * g++ -Wall -std=c++11 evp-encrypt.cxx -o evp-encrypt.exe -lcrypto
*/

#include <array>
#include <iomanip>
#include <iostream>

#include <openssl/rand.h>

#include "evp-encrypt.hpp"
#include "utils.hpp"

using namespace std;

int main(int argc, char *argv[])
{
  // key, iv
  array<Byte, KEY_SIZE> key;
  array<Byte, BLOCK_SIZE> iv;

  RAND_bytes(&key[0], KEY_SIZE);
  RAND_bytes(&iv[0], BLOCK_SIZE);

  // Note: The actual secret message used in the lab hosted
  //       on the SEED website is different from this one.
  string msg = "This is a top secret!";
  Bytes ptext(msg.begin(), msg.end());
  Bytes ctext;

  ctext = aes_encrypt(key.data(), iv.data(), ptext);

  cout << hexlify(iv) << hexlify(ctext) << endl;

  string buf;
  while (true)
  {
    cin >> buf;

    try
    {
      Bytes input = unhexlify(buf);
      Bytes ctext2(input.begin() + BLOCK_SIZE, input.end());

      aes_decrypt(key.data(), input.data(), ctext2);
      cout << "Valid" << endl;
    }
    catch (const std::bad_alloc &err)
    {
      cout << "Invalid hex string" << endl;
    }
    catch (const std::runtime_error &err)
    {
      cout << "Invalid" << endl;
    }
  }

  return 0;
}
