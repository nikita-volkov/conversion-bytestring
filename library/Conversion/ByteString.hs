module Conversion.ByteString () where

import BasePrelude
import Conversion
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Builder as BB


instance Conversion BS.ByteString [Word8] where
  {-# INLINE convert #-}
  convert = BS.unpack

instance Conversion BS.ByteString BL.ByteString where
  {-# INLINE convert #-}
  convert = BL.fromStrict

instance Conversion BS.ByteString BB.Builder where
  {-# INLINE convert #-}
  convert = BB.byteString


instance Conversion BL.ByteString [Word8] where
  {-# INLINE convert #-}
  convert = BL.unpack

instance Conversion BL.ByteString BS.ByteString where
  {-# INLINE convert #-}
  convert = BL.toStrict

instance Conversion BL.ByteString BB.Builder where
  {-# INLINE convert #-}
  convert = BB.lazyByteString


instance Conversion BB.Builder [Word8] where
  {-# INLINE convert #-}
  convert = convert . BB.toLazyByteString

instance Conversion BB.Builder BS.ByteString where
  {-# INLINE convert #-}
  convert = convert . BB.toLazyByteString

instance Conversion BB.Builder BL.ByteString where
  {-# INLINE convert #-}
  convert = BB.toLazyByteString


instance Conversion [Word8] BS.ByteString where
  {-# INLINE convert #-}
  convert = BS.pack

instance Conversion [Word8] BL.ByteString where
  {-# INLINE convert #-}
  convert = BL.pack

instance Conversion [Word8] BB.Builder where
  {-# INLINE convert #-}
  convert = foldMap BB.word8


instance Conversion Word8 BS.ByteString where
  {-# INLINE convert #-}
  convert = BS.singleton

instance Conversion Word8 BL.ByteString where
  {-# INLINE convert #-}
  convert = BL.singleton

instance Conversion Word8 BB.Builder where
  {-# INLINE convert #-}
  convert = BB.word8

