-- |
-- Module      : Crypto.Cipher.Blowfish.Box
-- License     : BSD-style
-- Stability   : experimental
-- Portability : Good
{-# LANGUAGE MagicHash #-}
module Crypto.Cipher.Blowfish.Box
    (   KeySchedule(..)
    ,   createKeySchedule
    ) where

import           Crypto.Internal.WordArray (MutableArray32,
                                            mutableArray32FromAddrBE)

newtype KeySchedule = KeySchedule MutableArray32

-- | Create a key schedule mutable array of the pbox followed by
-- all the sboxes.
createKeySchedule :: IO KeySchedule
createKeySchedule = KeySchedule `fmap` mutableArray32FromAddrBE 1042 "\
    \\x24\x3f\x6a\x88\x85\xa3\x08\xd3\x13\x19\x8a\x2e\x03\x70\x73\x44\
    \\xa4\x09\x38\x22\x29\x9f\x31\xd0\x08\x2e\xfa\x98\xec\x4e\x6c\x89\
    \\x45\x28\x21\xe6\x38\xd0\x13\x77\xbe\x54\x66\xcf\x34\xe9\x0c\x6c\
    \\xc0\xac\x29\xb7\xc9\x7c\x50\xdd\x3f\x84\xd5\xb5\xb5\x47\x09\x17\
    \\x92\x16\xd5\xd9\x89\x79\xfb\x1b\
    \\xd1\x31\x0b\xa6\x98\xdf\xb5\xac\x2f\xfd\x72\xdb\xd0\x1a\xdf\xb7\
    \\xb8\xe1\xaf\xed\x6a\x26\x7e\x96\xba\x7c\x90\x45\xf1\x2c\x7f\x99\
    \\x24\xa1\x99\x47\xb3\x91\x6c\xf7\x08\x01\xf2\xe2\x85\x8e\xfc\x16\
    \\x63\x69\x20\xd8\x71\x57\x4e\x69\xa4\x58\xfe\xa3\xf4\x93\x3d\x7e\
    \\x0d\x95\x74\x8f\x72\x8e\xb6\x58\x71\x8b\xcd\x58\x82\x15\x4a\xee\
    \\x7b\x54\xa4\x1d\xc2\x5a\x59\xb5\x9c\x30\xd5\x39\x2a\xf2\x60\x13\
    \\xc5\xd1\xb0\x23\x28\x60\x85\xf0\xca\x41\x79\x18\xb8\xdb\x38\xef\
    \\x8e\x79\xdc\xb0\x60\x3a\x18\x0e\x6c\x9e\x0e\x8b\xb0\x1e\x8a\x3e\
    \\xd7\x15\x77\xc1\xbd\x31\x4b\x27\x78\xaf\x2f\xda\x55\x60\x5c\x60\
    \\xe6\x55\x25\xf3\xaa\x55\xab\x94\x57\x48\x98\x62\x63\xe8\x14\x40\
    \\x55\xca\x39\x6a\x2a\xab\x10\xb6\xb4\xcc\x5c\x34\x11\x41\xe8\xce\
    \\xa1\x54\x86\xaf\x7c\x72\xe9\x93\xb3\xee\x14\x11\x63\x6f\xbc\x2a\
    \\x2b\xa9\xc5\x5d\x74\x18\x31\xf6\xce\x5c\x3e\x16\x9b\x87\x93\x1e\
    \\xaf\xd6\xba\x33\x6c\x24\xcf\x5c\x7a\x32\x53\x81\x28\x95\x86\x77\
    \\x3b\x8f\x48\x98\x6b\x4b\xb9\xaf\xc4\xbf\xe8\x1b\x66\x28\x21\x93\
    \\x61\xd8\x09\xcc\xfb\x21\xa9\x91\x48\x7c\xac\x60\x5d\xec\x80\x32\
    \\xef\x84\x5d\x5d\xe9\x85\x75\xb1\xdc\x26\x23\x02\xeb\x65\x1b\x88\
    \\x23\x89\x3e\x81\xd3\x96\xac\xc5\x0f\x6d\x6f\xf3\x83\xf4\x42\x39\
    \\x2e\x0b\x44\x82\xa4\x84\x20\x04\x69\xc8\xf0\x4a\x9e\x1f\x9b\x5e\
    \\x21\xc6\x68\x42\xf6\xe9\x6c\x9a\x67\x0c\x9c\x61\xab\xd3\x88\xf0\
    \\x6a\x51\xa0\xd2\xd8\x54\x2f\x68\x96\x0f\xa7\x28\xab\x51\x33\xa3\
    \\x6e\xef\x0b\x6c\x13\x7a\x3b\xe4\xba\x3b\xf0\x50\x7e\xfb\x2a\x98\
    \\xa1\xf1\x65\x1d\x39\xaf\x01\x76\x66\xca\x59\x3e\x82\x43\x0e\x88\
    \\x8c\xee\x86\x19\x45\x6f\x9f\xb4\x7d\x84\xa5\xc3\x3b\x8b\x5e\xbe\
    \\xe0\x6f\x75\xd8\x85\xc1\x20\x73\x40\x1a\x44\x9f\x56\xc1\x6a\xa6\
    \\x4e\xd3\xaa\x62\x36\x3f\x77\x06\x1b\xfe\xdf\x72\x42\x9b\x02\x3d\
    \\x37\xd0\xd7\x24\xd0\x0a\x12\x48\xdb\x0f\xea\xd3\x49\xf1\xc0\x9b\
    \\x07\x53\x72\xc9\x80\x99\x1b\x7b\x25\xd4\x79\xd8\xf6\xe8\xde\xf7\
    \\xe3\xfe\x50\x1a\xb6\x79\x4c\x3b\x97\x6c\xe0\xbd\x04\xc0\x06\xba\
    \\xc1\xa9\x4f\xb6\x40\x9f\x60\xc4\x5e\x5c\x9e\xc2\x19\x6a\x24\x63\
    \\x68\xfb\x6f\xaf\x3e\x6c\x53\xb5\x13\x39\xb2\xeb\x3b\x52\xec\x6f\
    \\x6d\xfc\x51\x1f\x9b\x30\x95\x2c\xcc\x81\x45\x44\xaf\x5e\xbd\x09\
    \\xbe\xe3\xd0\x04\xde\x33\x4a\xfd\x66\x0f\x28\x07\x19\x2e\x4b\xb3\
    \\xc0\xcb\xa8\x57\x45\xc8\x74\x0f\xd2\x0b\x5f\x39\xb9\xd3\xfb\xdb\
    \\x55\x79\xc0\xbd\x1a\x60\x32\x0a\xd6\xa1\x00\xc6\x40\x2c\x72\x79\
    \\x67\x9f\x25\xfe\xfb\x1f\xa3\xcc\x8e\xa5\xe9\xf8\xdb\x32\x22\xf8\
    \\x3c\x75\x16\xdf\xfd\x61\x6b\x15\x2f\x50\x1e\xc8\xad\x05\x52\xab\
    \\x32\x3d\xb5\xfa\xfd\x23\x87\x60\x53\x31\x7b\x48\x3e\x00\xdf\x82\
    \\x9e\x5c\x57\xbb\xca\x6f\x8c\xa0\x1a\x87\x56\x2e\xdf\x17\x69\xdb\
    \\xd5\x42\xa8\xf6\x28\x7e\xff\xc3\xac\x67\x32\xc6\x8c\x4f\x55\x73\
    \\x69\x5b\x27\xb0\xbb\xca\x58\xc8\xe1\xff\xa3\x5d\xb8\xf0\x11\xa0\
    \\x10\xfa\x3d\x98\xfd\x21\x83\xb8\x4a\xfc\xb5\x6c\x2d\xd1\xd3\x5b\
    \\x9a\x53\xe4\x79\xb6\xf8\x45\x65\xd2\x8e\x49\xbc\x4b\xfb\x97\x90\
    \\xe1\xdd\xf2\xda\xa4\xcb\x7e\x33\x62\xfb\x13\x41\xce\xe4\xc6\xe8\
    \\xef\x20\xca\xda\x36\x77\x4c\x01\xd0\x7e\x9e\xfe\x2b\xf1\x1f\xb4\
    \\x95\xdb\xda\x4d\xae\x90\x91\x98\xea\xad\x8e\x71\x6b\x93\xd5\xa0\
    \\xd0\x8e\xd1\xd0\xaf\xc7\x25\xe0\x8e\x3c\x5b\x2f\x8e\x75\x94\xb7\
    \\x8f\xf6\xe2\xfb\xf2\x12\x2b\x64\x88\x88\xb8\x12\x90\x0d\xf0\x1c\
    \\x4f\xad\x5e\xa0\x68\x8f\xc3\x1c\xd1\xcf\xf1\x91\xb3\xa8\xc1\xad\
    \\x2f\x2f\x22\x18\xbe\x0e\x17\x77\xea\x75\x2d\xfe\x8b\x02\x1f\xa1\
    \\xe5\xa0\xcc\x0f\xb5\x6f\x74\xe8\x18\xac\xf3\xd6\xce\x89\xe2\x99\
    \\xb4\xa8\x4f\xe0\xfd\x13\xe0\xb7\x7c\xc4\x3b\x81\xd2\xad\xa8\xd9\
    \\x16\x5f\xa2\x66\x80\x95\x77\x05\x93\xcc\x73\x14\x21\x1a\x14\x77\
    \\xe6\xad\x20\x65\x77\xb5\xfa\x86\xc7\x54\x42\xf5\xfb\x9d\x35\xcf\
    \\xeb\xcd\xaf\x0c\x7b\x3e\x89\xa0\xd6\x41\x1b\xd3\xae\x1e\x7e\x49\
    \\x00\x25\x0e\x2d\x20\x71\xb3\x5e\x22\x68\x00\xbb\x57\xb8\xe0\xaf\
    \\x24\x64\x36\x9b\xf0\x09\xb9\x1e\x55\x63\x91\x1d\x59\xdf\xa6\xaa\
    \\x78\xc1\x43\x89\xd9\x5a\x53\x7f\x20\x7d\x5b\xa2\x02\xe5\xb9\xc5\
    \\x83\x26\x03\x76\x62\x95\xcf\xa9\x11\xc8\x19\x68\x4e\x73\x4a\x41\
    \\xb3\x47\x2d\xca\x7b\x14\xa9\x4a\x1b\x51\x00\x52\x9a\x53\x29\x15\
    \\xd6\x0f\x57\x3f\xbc\x9b\xc6\xe4\x2b\x60\xa4\x76\x81\xe6\x74\x00\
    \\x08\xba\x6f\xb5\x57\x1b\xe9\x1f\xf2\x96\xec\x6b\x2a\x0d\xd9\x15\
    \\xb6\x63\x65\x21\xe7\xb9\xf9\xb6\xff\x34\x05\x2e\xc5\x85\x56\x64\
    \\x53\xb0\x2d\x5d\xa9\x9f\x8f\xa1\x08\xba\x47\x99\x6e\x85\x07\x6a\
    \\x4b\x7a\x70\xe9\xb5\xb3\x29\x44\xdb\x75\x09\x2e\xc4\x19\x26\x23\
    \\xad\x6e\xa6\xb0\x49\xa7\xdf\x7d\x9c\xee\x60\xb8\x8f\xed\xb2\x66\
    \\xec\xaa\x8c\x71\x69\x9a\x17\xff\x56\x64\x52\x6c\xc2\xb1\x9e\xe1\
    \\x19\x36\x02\xa5\x75\x09\x4c\x29\xa0\x59\x13\x40\xe4\x18\x3a\x3e\
    \\x3f\x54\x98\x9a\x5b\x42\x9d\x65\x6b\x8f\xe4\xd6\x99\xf7\x3f\xd6\
    \\xa1\xd2\x9c\x07\xef\xe8\x30\xf5\x4d\x2d\x38\xe6\xf0\x25\x5d\xc1\
    \\x4c\xdd\x20\x86\x84\x70\xeb\x26\x63\x82\xe9\xc6\x02\x1e\xcc\x5e\
    \\x09\x68\x6b\x3f\x3e\xba\xef\xc9\x3c\x97\x18\x14\x6b\x6a\x70\xa1\
    \\x68\x7f\x35\x84\x52\xa0\xe2\x86\xb7\x9c\x53\x05\xaa\x50\x07\x37\
    \\x3e\x07\x84\x1c\x7f\xde\xae\x5c\x8e\x7d\x44\xec\x57\x16\xf2\xb8\
    \\xb0\x3a\xda\x37\xf0\x50\x0c\x0d\xf0\x1c\x1f\x04\x02\x00\xb3\xff\
    \\xae\x0c\xf5\x1a\x3c\xb5\x74\xb2\x25\x83\x7a\x58\xdc\x09\x21\xbd\
    \\xd1\x91\x13\xf9\x7c\xa9\x2f\xf6\x94\x32\x47\x73\x22\xf5\x47\x01\
    \\x3a\xe5\xe5\x81\x37\xc2\xda\xdc\xc8\xb5\x76\x34\x9a\xf3\xdd\xa7\
    \\xa9\x44\x61\x46\x0f\xd0\x03\x0e\xec\xc8\xc7\x3e\xa4\x75\x1e\x41\
    \\xe2\x38\xcd\x99\x3b\xea\x0e\x2f\x32\x80\xbb\xa1\x18\x3e\xb3\x31\
    \\x4e\x54\x8b\x38\x4f\x6d\xb9\x08\x6f\x42\x0d\x03\xf6\x0a\x04\xbf\
    \\x2c\xb8\x12\x90\x24\x97\x7c\x79\x56\x79\xb0\x72\xbc\xaf\x89\xaf\
    \\xde\x9a\x77\x1f\xd9\x93\x08\x10\xb3\x8b\xae\x12\xdc\xcf\x3f\x2e\
    \\x55\x12\x72\x1f\x2e\x6b\x71\x24\x50\x1a\xdd\xe6\x9f\x84\xcd\x87\
    \\x7a\x58\x47\x18\x74\x08\xda\x17\xbc\x9f\x9a\xbc\xe9\x4b\x7d\x8c\
    \\xec\x7a\xec\x3a\xdb\x85\x1d\xfa\x63\x09\x43\x66\xc4\x64\xc3\xd2\
    \\xef\x1c\x18\x47\x32\x15\xd9\x08\xdd\x43\x3b\x37\x24\xc2\xba\x16\
    \\x12\xa1\x4d\x43\x2a\x65\xc4\x51\x50\x94\x00\x02\x13\x3a\xe4\xdd\
    \\x71\xdf\xf8\x9e\x10\x31\x4e\x55\x81\xac\x77\xd6\x5f\x11\x19\x9b\
    \\x04\x35\x56\xf1\xd7\xa3\xc7\x6b\x3c\x11\x18\x3b\x59\x24\xa5\x09\
    \\xf2\x8f\xe6\xed\x97\xf1\xfb\xfa\x9e\xba\xbf\x2c\x1e\x15\x3c\x6e\
    \\x86\xe3\x45\x70\xea\xe9\x6f\xb1\x86\x0e\x5e\x0a\x5a\x3e\x2a\xb3\
    \\x77\x1f\xe7\x1c\x4e\x3d\x06\xfa\x29\x65\xdc\xb9\x99\xe7\x1d\x0f\
    \\x80\x3e\x89\xd6\x52\x66\xc8\x25\x2e\x4c\xc9\x78\x9c\x10\xb3\x6a\
    \\xc6\x15\x0e\xba\x94\xe2\xea\x78\xa5\xfc\x3c\x53\x1e\x0a\x2d\xf4\
    \\xf2\xf7\x4e\xa7\x36\x1d\x2b\x3d\x19\x39\x26\x0f\x19\xc2\x79\x60\
    \\x52\x23\xa7\x08\xf7\x13\x12\xb6\xeb\xad\xfe\x6e\xea\xc3\x1f\x66\
    \\xe3\xbc\x45\x95\xa6\x7b\xc8\x83\xb1\x7f\x37\xd1\x01\x8c\xff\x28\
    \\xc3\x32\xdd\xef\xbe\x6c\x5a\xa5\x65\x58\x21\x85\x68\xab\x98\x02\
    \\xee\xce\xa5\x0f\xdb\x2f\x95\x3b\x2a\xef\x7d\xad\x5b\x6e\x2f\x84\
    \\x15\x21\xb6\x28\x29\x07\x61\x70\xec\xdd\x47\x75\x61\x9f\x15\x10\
    \\x13\xcc\xa8\x30\xeb\x61\xbd\x96\x03\x34\xfe\x1e\xaa\x03\x63\xcf\
    \\xb5\x73\x5c\x90\x4c\x70\xa2\x39\xd5\x9e\x9e\x0b\xcb\xaa\xde\x14\
    \\xee\xcc\x86\xbc\x60\x62\x2c\xa7\x9c\xab\x5c\xab\xb2\xf3\x84\x6e\
    \\x64\x8b\x1e\xaf\x19\xbd\xf0\xca\xa0\x23\x69\xb9\x65\x5a\xbb\x50\
    \\x40\x68\x5a\x32\x3c\x2a\xb4\xb3\x31\x9e\xe9\xd5\xc0\x21\xb8\xf7\
    \\x9b\x54\x0b\x19\x87\x5f\xa0\x99\x95\xf7\x99\x7e\x62\x3d\x7d\xa8\
    \\xf8\x37\x88\x9a\x97\xe3\x2d\x77\x11\xed\x93\x5f\x16\x68\x12\x81\
    \\x0e\x35\x88\x29\xc7\xe6\x1f\xd6\x96\xde\xdf\xa1\x78\x58\xba\x99\
    \\x57\xf5\x84\xa5\x1b\x22\x72\x63\x9b\x83\xc3\xff\x1a\xc2\x46\x96\
    \\xcd\xb3\x0a\xeb\x53\x2e\x30\x54\x8f\xd9\x48\xe4\x6d\xbc\x31\x28\
    \\x58\xeb\xf2\xef\x34\xc6\xff\xea\xfe\x28\xed\x61\xee\x7c\x3c\x73\
    \\x5d\x4a\x14\xd9\xe8\x64\xb7\xe3\x42\x10\x5d\x14\x20\x3e\x13\xe0\
    \\x45\xee\xe2\xb6\xa3\xaa\xab\xea\xdb\x6c\x4f\x15\xfa\xcb\x4f\xd0\
    \\xc7\x42\xf4\x42\xef\x6a\xbb\xb5\x65\x4f\x3b\x1d\x41\xcd\x21\x05\
    \\xd8\x1e\x79\x9e\x86\x85\x4d\xc7\xe4\x4b\x47\x6a\x3d\x81\x62\x50\
    \\xcf\x62\xa1\xf2\x5b\x8d\x26\x46\xfc\x88\x83\xa0\xc1\xc7\xb6\xa3\
    \\x7f\x15\x24\xc3\x69\xcb\x74\x92\x47\x84\x8a\x0b\x56\x92\xb2\x85\
    \\x09\x5b\xbf\x00\xad\x19\x48\x9d\x14\x62\xb1\x74\x23\x82\x0e\x00\
    \\x58\x42\x8d\x2a\x0c\x55\xf5\xea\x1d\xad\xf4\x3e\x23\x3f\x70\x61\
    \\x33\x72\xf0\x92\x8d\x93\x7e\x41\xd6\x5f\xec\xf1\x6c\x22\x3b\xdb\
    \\x7c\xde\x37\x59\xcb\xee\x74\x60\x40\x85\xf2\xa7\xce\x77\x32\x6e\
    \\xa6\x07\x80\x84\x19\xf8\x50\x9e\xe8\xef\xd8\x55\x61\xd9\x97\x35\
    \\xa9\x69\xa7\xaa\xc5\x0c\x06\xc2\x5a\x04\xab\xfc\x80\x0b\xca\xdc\
    \\x9e\x44\x7a\x2e\xc3\x45\x34\x84\xfd\xd5\x67\x05\x0e\x1e\x9e\xc9\
    \\xdb\x73\xdb\xd3\x10\x55\x88\xcd\x67\x5f\xda\x79\xe3\x67\x43\x40\
    \\xc5\xc4\x34\x65\x71\x3e\x38\xd8\x3d\x28\xf8\x9e\xf1\x6d\xff\x20\
    \\x15\x3e\x21\xe7\x8f\xb0\x3d\x4a\xe6\xe3\x9f\x2b\xdb\x83\xad\xf7\
    \\xe9\x3d\x5a\x68\x94\x81\x40\xf7\xf6\x4c\x26\x1c\x94\x69\x29\x34\
    \\x41\x15\x20\xf7\x76\x02\xd4\xf7\xbc\xf4\x6b\x2e\xd4\xa2\x00\x68\
    \\xd4\x08\x24\x71\x33\x20\xf4\x6a\x43\xb7\xd4\xb7\x50\x00\x61\xaf\
    \\x1e\x39\xf6\x2e\x97\x24\x45\x46\x14\x21\x4f\x74\xbf\x8b\x88\x40\
    \\x4d\x95\xfc\x1d\x96\xb5\x91\xaf\x70\xf4\xdd\xd3\x66\xa0\x2f\x45\
    \\xbf\xbc\x09\xec\x03\xbd\x97\x85\x7f\xac\x6d\xd0\x31\xcb\x85\x04\
    \\x96\xeb\x27\xb3\x55\xfd\x39\x41\xda\x25\x47\xe6\xab\xca\x0a\x9a\
    \\x28\x50\x78\x25\x53\x04\x29\xf4\x0a\x2c\x86\xda\xe9\xb6\x6d\xfb\
    \\x68\xdc\x14\x62\xd7\x48\x69\x00\x68\x0e\xc0\xa4\x27\xa1\x8d\xee\
    \\x4f\x3f\xfe\xa2\xe8\x87\xad\x8c\xb5\x8c\xe0\x06\x7a\xf4\xd6\xb6\
    \\xaa\xce\x1e\x7c\xd3\x37\x5f\xec\xce\x78\xa3\x99\x40\x6b\x2a\x42\
    \\x20\xfe\x9e\x35\xd9\xf3\x85\xb9\xee\x39\xd7\xab\x3b\x12\x4e\x8b\
    \\x1d\xc9\xfa\xf7\x4b\x6d\x18\x56\x26\xa3\x66\x31\xea\xe3\x97\xb2\
    \\x3a\x6e\xfa\x74\xdd\x5b\x43\x32\x68\x41\xe7\xf7\xca\x78\x20\xfb\
    \\xfb\x0a\xf5\x4e\xd8\xfe\xb3\x97\x45\x40\x56\xac\xba\x48\x95\x27\
    \\x55\x53\x3a\x3a\x20\x83\x8d\x87\xfe\x6b\xa9\xb7\xd0\x96\x95\x4b\
    \\x55\xa8\x67\xbc\xa1\x15\x9a\x58\xcc\xa9\x29\x63\x99\xe1\xdb\x33\
    \\xa6\x2a\x4a\x56\x3f\x31\x25\xf9\x5e\xf4\x7e\x1c\x90\x29\x31\x7c\
    \\xfd\xf8\xe8\x02\x04\x27\x2f\x70\x80\xbb\x15\x5c\x05\x28\x2c\xe3\
    \\x95\xc1\x15\x48\xe4\xc6\x6d\x22\x48\xc1\x13\x3f\xc7\x0f\x86\xdc\
    \\x07\xf9\xc9\xee\x41\x04\x1f\x0f\x40\x47\x79\xa4\x5d\x88\x6e\x17\
    \\x32\x5f\x51\xeb\xd5\x9b\xc0\xd1\xf2\xbc\xc1\x8f\x41\x11\x35\x64\
    \\x25\x7b\x78\x34\x60\x2a\x9c\x60\xdf\xf8\xe8\xa3\x1f\x63\x6c\x1b\
    \\x0e\x12\xb4\xc2\x02\xe1\x32\x9e\xaf\x66\x4f\xd1\xca\xd1\x81\x15\
    \\x6b\x23\x95\xe0\x33\x3e\x92\xe1\x3b\x24\x0b\x62\xee\xbe\xb9\x22\
    \\x85\xb2\xa2\x0e\xe6\xba\x0d\x99\xde\x72\x0c\x8c\x2d\xa2\xf7\x28\
    \\xd0\x12\x78\x45\x95\xb7\x94\xfd\x64\x7d\x08\x62\xe7\xcc\xf5\xf0\
    \\x54\x49\xa3\x6f\x87\x7d\x48\xfa\xc3\x9d\xfd\x27\xf3\x3e\x8d\x1e\
    \\x0a\x47\x63\x41\x99\x2e\xff\x74\x3a\x6f\x6e\xab\xf4\xf8\xfd\x37\
    \\xa8\x12\xdc\x60\xa1\xeb\xdd\xf8\x99\x1b\xe1\x4c\xdb\x6e\x6b\x0d\
    \\xc6\x7b\x55\x10\x6d\x67\x2c\x37\x27\x65\xd4\x3b\xdc\xd0\xe8\x04\
    \\xf1\x29\x0d\xc7\xcc\x00\xff\xa3\xb5\x39\x0f\x92\x69\x0f\xed\x0b\
    \\x66\x7b\x9f\xfb\xce\xdb\x7d\x9c\xa0\x91\xcf\x0b\xd9\x15\x5e\xa3\
    \\xbb\x13\x2f\x88\x51\x5b\xad\x24\x7b\x94\x79\xbf\x76\x3b\xd6\xeb\
    \\x37\x39\x2e\xb3\xcc\x11\x59\x79\x80\x26\xe2\x97\xf4\x2e\x31\x2d\
    \\x68\x42\xad\xa7\xc6\x6a\x2b\x3b\x12\x75\x4c\xcc\x78\x2e\xf1\x1c\
    \\x6a\x12\x42\x37\xb7\x92\x51\xe7\x06\xa1\xbb\xe6\x4b\xfb\x63\x50\
    \\x1a\x6b\x10\x18\x11\xca\xed\xfa\x3d\x25\xbd\xd8\xe2\xe1\xc3\xc9\
    \\x44\x42\x16\x59\x0a\x12\x13\x86\xd9\x0c\xec\x6e\xd5\xab\xea\x2a\
    \\x64\xaf\x67\x4e\xda\x86\xa8\x5f\xbe\xbf\xe9\x88\x64\xe4\xc3\xfe\
    \\x9d\xbc\x80\x57\xf0\xf7\xc0\x86\x60\x78\x7b\xf8\x60\x03\x60\x4d\
    \\xd1\xfd\x83\x46\xf6\x38\x1f\xb0\x77\x45\xae\x04\xd7\x36\xfc\xcc\
    \\x83\x42\x6b\x33\xf0\x1e\xab\x71\xb0\x80\x41\x87\x3c\x00\x5e\x5f\
    \\x77\xa0\x57\xbe\xbd\xe8\xae\x24\x55\x46\x42\x99\xbf\x58\x2e\x61\
    \\x4e\x58\xf4\x8f\xf2\xdd\xfd\xa2\xf4\x74\xef\x38\x87\x89\xbd\xc2\
    \\x53\x66\xf9\xc3\xc8\xb3\x8e\x74\xb4\x75\xf2\x55\x46\xfc\xd9\xb9\
    \\x7a\xeb\x26\x61\x8b\x1d\xdf\x84\x84\x6a\x0e\x79\x91\x5f\x95\xe2\
    \\x46\x6e\x59\x8e\x20\xb4\x57\x70\x8c\xd5\x55\x91\xc9\x02\xde\x4c\
    \\xb9\x0b\xac\xe1\xbb\x82\x05\xd0\x11\xa8\x62\x48\x75\x74\xa9\x9e\
    \\xb7\x7f\x19\xb6\xe0\xa9\xdc\x09\x66\x2d\x09\xa1\xc4\x32\x46\x33\
    \\xe8\x5a\x1f\x02\x09\xf0\xbe\x8c\x4a\x99\xa0\x25\x1d\x6e\xfe\x10\
    \\x1a\xb9\x3d\x1d\x0b\xa5\xa4\xdf\xa1\x86\xf2\x0f\x28\x68\xf1\x69\
    \\xdc\xb7\xda\x83\x57\x39\x06\xfe\xa1\xe2\xce\x9b\x4f\xcd\x7f\x52\
    \\x50\x11\x5e\x01\xa7\x06\x83\xfa\xa0\x02\xb5\xc4\x0d\xe6\xd0\x27\
    \\x9a\xf8\x8c\x27\x77\x3f\x86\x41\xc3\x60\x4c\x06\x61\xa8\x06\xb5\
    \\xf0\x17\x7a\x28\xc0\xf5\x86\xe0\x00\x60\x58\xaa\x30\xdc\x7d\x62\
    \\x11\xe6\x9e\xd7\x23\x38\xea\x63\x53\xc2\xdd\x94\xc2\xc2\x16\x34\
    \\xbb\xcb\xee\x56\x90\xbc\xb6\xde\xeb\xfc\x7d\xa1\xce\x59\x1d\x76\
    \\x6f\x05\xe4\x09\x4b\x7c\x01\x88\x39\x72\x0a\x3d\x7c\x92\x7c\x24\
    \\x86\xe3\x72\x5f\x72\x4d\x9d\xb9\x1a\xc1\x5b\xb4\xd3\x9e\xb8\xfc\
    \\xed\x54\x55\x78\x08\xfc\xa5\xb5\xd8\x3d\x7c\xd3\x4d\xad\x0f\xc4\
    \\x1e\x50\xef\x5e\xb1\x61\xe6\xf8\xa2\x85\x14\xd9\x6c\x51\x13\x3c\
    \\x6f\xd5\xc7\xe7\x56\xe1\x4e\xc4\x36\x2a\xbf\xce\xdd\xc6\xc8\x37\
    \\xd7\x9a\x32\x34\x92\x63\x82\x12\x67\x0e\xfa\x8e\x40\x60\x00\xe0\
    \\x3a\x39\xce\x37\xd3\xfa\xf5\xcf\xab\xc2\x77\x37\x5a\xc5\x2d\x1b\
    \\x5c\xb0\x67\x9e\x4f\xa3\x37\x42\xd3\x82\x27\x40\x99\xbc\x9b\xbe\
    \\xd5\x11\x8e\x9d\xbf\x0f\x73\x15\xd6\x2d\x1c\x7e\xc7\x00\xc4\x7b\
    \\xb7\x8c\x1b\x6b\x21\xa1\x90\x45\xb2\x6e\xb1\xbe\x6a\x36\x6e\xb4\
    \\x57\x48\xab\x2f\xbc\x94\x6e\x79\xc6\xa3\x76\xd2\x65\x49\xc2\xc8\
    \\x53\x0f\xf8\xee\x46\x8d\xde\x7d\xd5\x73\x0a\x1d\x4c\xd0\x4d\xc6\
    \\x29\x39\xbb\xdb\xa9\xba\x46\x50\xac\x95\x26\xe8\xbe\x5e\xe3\x04\
    \\xa1\xfa\xd5\xf0\x6a\x2d\x51\x9a\x63\xef\x8c\xe2\x9a\x86\xee\x22\
    \\xc0\x89\xc2\xb8\x43\x24\x2e\xf6\xa5\x1e\x03\xaa\x9c\xf2\xd0\xa4\
    \\x83\xc0\x61\xba\x9b\xe9\x6a\x4d\x8f\xe5\x15\x50\xba\x64\x5b\xd6\
    \\x28\x26\xa2\xf9\xa7\x3a\x3a\xe1\x4b\xa9\x95\x86\xef\x55\x62\xe9\
    \\xc7\x2f\xef\xd3\xf7\x52\xf7\xda\x3f\x04\x6f\x69\x77\xfa\x0a\x59\
    \\x80\xe4\xa9\x15\x87\xb0\x86\x01\x9b\x09\xe6\xad\x3b\x3e\xe5\x93\
    \\xe9\x90\xfd\x5a\x9e\x34\xd7\x97\x2c\xf0\xb7\xd9\x02\x2b\x8b\x51\
    \\x96\xd5\xac\x3a\x01\x7d\xa6\x7d\xd1\xcf\x3e\xd6\x7c\x7d\x2d\x28\
    \\x1f\x9f\x25\xcf\xad\xf2\xb8\x9b\x5a\xd6\xb4\x72\x5a\x88\xf5\x4c\
    \\xe0\x29\xac\x71\xe0\x19\xa5\xe6\x47\xb0\xac\xfd\xed\x93\xfa\x9b\
    \\xe8\xd3\xc4\x8d\x28\x3b\x57\xcc\xf8\xd5\x66\x29\x79\x13\x2e\x28\
    \\x78\x5f\x01\x91\xed\x75\x60\x55\xf7\x96\x0e\x44\xe3\xd3\x5e\x8c\
    \\x15\x05\x6d\xd4\x88\xf4\x6d\xba\x03\xa1\x61\x25\x05\x64\xf0\xbd\
    \\xc3\xeb\x9e\x15\x3c\x90\x57\xa2\x97\x27\x1a\xec\xa9\x3a\x07\x2a\
    \\x1b\x3f\x6d\x9b\x1e\x63\x21\xf5\xf5\x9c\x66\xfb\x26\xdc\xf3\x19\
    \\x75\x33\xd9\x28\xb1\x55\xfd\xf5\x03\x56\x34\x82\x8a\xba\x3c\xbb\
    \\x28\x51\x77\x11\xc2\x0a\xd9\xf8\xab\xcc\x51\x67\xcc\xad\x92\x5f\
    \\x4d\xe8\x17\x51\x38\x30\xdc\x8e\x37\x9d\x58\x62\x93\x20\xf9\x91\
    \\xea\x7a\x90\xc2\xfb\x3e\x7b\xce\x51\x21\xce\x64\x77\x4f\xbe\x32\
    \\xa8\xb6\xe3\x7e\xc3\x29\x3d\x46\x48\xde\x53\x69\x64\x13\xe6\x80\
    \\xa2\xae\x08\x10\xdd\x6d\xb2\x24\x69\x85\x2d\xfd\x09\x07\x21\x66\
    \\xb3\x9a\x46\x0a\x64\x45\xc0\xdd\x58\x6c\xde\xcf\x1c\x20\xc8\xae\
    \\x5b\xbe\xf7\xdd\x1b\x58\x8d\x40\xcc\xd2\x01\x7f\x6b\xb4\xe3\xbb\
    \\xdd\xa2\x6a\x7e\x3a\x59\xff\x45\x3e\x35\x0a\x44\xbc\xb4\xcd\xd5\
    \\x72\xea\xce\xa8\xfa\x64\x84\xbb\x8d\x66\x12\xae\xbf\x3c\x6f\x47\
    \\xd2\x9b\xe4\x63\x54\x2f\x5d\x9e\xae\xc2\x77\x1b\xf6\x4e\x63\x70\
    \\x74\x0e\x0d\x8d\xe7\x5b\x13\x57\xf8\x72\x16\x71\xaf\x53\x7d\x5d\
    \\x40\x40\xcb\x08\x4e\xb4\xe2\xcc\x34\xd2\x46\x6a\x01\x15\xaf\x84\
    \\xe1\xb0\x04\x28\x95\x98\x3a\x1d\x06\xb8\x9f\xb4\xce\x6e\xa0\x48\
    \\x6f\x3f\x3b\x82\x35\x20\xab\x82\x01\x1a\x1d\x4b\x27\x72\x27\xf8\
    \\x61\x15\x60\xb1\xe7\x93\x3f\xdc\xbb\x3a\x79\x2b\x34\x45\x25\xbd\
    \\xa0\x88\x39\xe1\x51\xce\x79\x4b\x2f\x32\xc9\xb7\xa0\x1f\xba\xc9\
    \\xe0\x1c\xc8\x7e\xbc\xc7\xd1\xf6\xcf\x01\x11\xc3\xa1\xe8\xaa\xc7\
    \\x1a\x90\x87\x49\xd4\x4f\xbd\x9a\xd0\xda\xde\xcb\xd5\x0a\xda\x38\
    \\x03\x39\xc3\x2a\xc6\x91\x36\x67\x8d\xf9\x31\x7c\xe0\xb1\x2b\x4f\
    \\xf7\x9e\x59\xb7\x43\xf5\xbb\x3a\xf2\xd5\x19\xff\x27\xd9\x45\x9c\
    \\xbf\x97\x22\x2c\x15\xe6\xfc\x2a\x0f\x91\xfc\x71\x9b\x94\x15\x25\
    \\xfa\xe5\x93\x61\xce\xb6\x9c\xeb\xc2\xa8\x64\x59\x12\xba\xa8\xd1\
    \\xb6\xc1\x07\x5e\xe3\x05\x6a\x0c\x10\xd2\x50\x65\xcb\x03\xa4\x42\
    \\xe0\xec\x6e\x0e\x16\x98\xdb\x3b\x4c\x98\xa0\xbe\x32\x78\xe9\x64\
    \\x9f\x1f\x95\x32\xe0\xd3\x92\xdf\xd3\xa0\x34\x2b\x89\x71\xf2\x1e\
    \\x1b\x0a\x74\x41\x4b\xa3\x34\x8c\xc5\xbe\x71\x20\xc3\x76\x32\xd8\
    \\xdf\x35\x9f\x8d\x9b\x99\x2f\x2e\xe6\x0b\x6f\x47\x0f\xe3\xf1\x1d\
    \\xe5\x4c\xda\x54\x1e\xda\xd8\x91\xce\x62\x79\xcf\xcd\x3e\x7e\x6f\
    \\x16\x18\xb1\x66\xfd\x2c\x1d\x05\x84\x8f\xd2\xc5\xf6\xfb\x22\x99\
    \\xf5\x23\xf3\x57\xa6\x32\x76\x23\x93\xa8\x35\x31\x56\xcc\xcd\x02\
    \\xac\xf0\x81\x62\x5a\x75\xeb\xb5\x6e\x16\x36\x97\x88\xd2\x73\xcc\
    \\xde\x96\x62\x92\x81\xb9\x49\xd0\x4c\x50\x90\x1b\x71\xc6\x56\x14\
    \\xe6\xc6\xc7\xbd\x32\x7a\x14\x0a\x45\xe1\xd0\x06\xc3\xf2\x7b\x9a\
    \\xc9\xaa\x53\xfd\x62\xa8\x0f\x00\xbb\x25\xbf\xe2\x35\xbd\xd2\xf6\
    \\x71\x12\x69\x05\xb2\x04\x02\x22\xb6\xcb\xcf\x7c\xcd\x76\x9c\x2b\
    \\x53\x11\x3e\xc0\x16\x40\xe3\xd3\x38\xab\xbd\x60\x25\x47\xad\xf0\
    \\xba\x38\x20\x9c\xf7\x46\xce\x76\x77\xaf\xa1\xc5\x20\x75\x60\x60\
    \\x85\xcb\xfe\x4e\x8a\xe8\x8d\xd8\x7a\xaa\xf9\xb0\x4c\xf9\xaa\x7e\
    \\x19\x48\xc2\x5c\x02\xfb\x8a\x8c\x01\xc3\x6a\xe4\xd6\xeb\xe1\xf9\
    \\x90\xd4\xf8\x69\xa6\x5c\xde\xa0\x3f\x09\x25\x2d\xc2\x08\xe6\x9f\
    \\xb7\x4e\x61\x32\xce\x77\xe2\x5b\x57\x8f\xdf\xe3\x3a\xc3\x72\xe6\
    \"#
