{-# LANGUAGE RecordWildCards #-}

module Lib
    ( someFunc
    ) where

import Control.Monad.Trans.Reader

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data UrlInfo = 
    UrlInfo { 
        _siteurl :: String,
        _board   :: String,
        _threadNumber :: String
}

buildUrl :: Reader UrlInfo String
buildUrl = do
    UrlInfo {..} <- ask
    return $ _siteurl ++ "/" ++ _board ++ "/res/" ++ _threadNumber ++ ".json"

