const currencyResponse = """
{
    "by": "default",
    "valid_key": true,
    "results": {
        "currencies": {
            "source": "BRL",
            "USD": {
                "name": "Dollar",
                "buy": 4.7903,
                "sell": 4.7903,
                "variation": -0.426
            },
            "EUR": {
                "name": "Euro",
                "buy": 5.3742,
                "sell": 5.3741,
                "variation": -0.513
            },
            "GBP": {
                "name": "Pound Sterling",
                "buy": 6.179,
                "sell": null,
                "variation": -1.507
            },
            "ARS": {
                "name": "Argentine Peso",
                "buy": 0.0179,
                "sell": null,
                "variation": -0.782
            },
            "CAD": {
                "name": "Canadian Dollar",
                "buy": 3.6391,
                "sell": null,
                "variation": -0.344
            },
            "AUD": {
                "name": "Australian Dollar",
                "buy": 3.2476,
                "sell": null,
                "variation": -0.895
            },
            "JPY": {
                "name": "Japanese Yen",
                "buy": 0.0343,
                "sell": null,
                "variation": -0.931
            },
            "CNY": {
                "name": "Renminbi",
                "buy": 0.6633,
                "sell": null,
                "variation": -1.002
            },
            "BTC": {
                "name": "Bitcoin",
                "buy": 152268.932,
                "sell": 152268.932,
                "variation": 0.552
            }
        },
        "stocks": {
            "IBOVESPA": {
                "name": "BM\u0026F BOVESPA",
                "location": "Sao Paulo, Brazil",
                "points": 117787.02,
                "variation": -0.05
            },
            "IFIX": {
                "name": "Índice de Fundos de Investimentos Imobiliários B3",
                "location": "Sao Paulo, Brazil",
                "points": 3182.1,
                "variation": 0.07
            },
            "NASDAQ": {
                "name": "NASDAQ Stock Market",
                "location": "New York City, United States",
                "points": 14391.15,
                "variation": 0.26
            },
            "DOWJONES": {
                "name": "Dow Jones Industrial Average",
                "location": "New York City, United States",
                "points": 35086.21,
                "variation": 0.38
            },
            "CAC": {
                "name": "CAC 40",
                "location": "Paris, French",
                "points": 7342.93,
                "variation": 0.32
            },
            "NIKKEI": {
                "name": "Nikkei 225",
                "location": "Tokyo, Japan",
                "points": 32896.03,
                "variation": 1.24
            }
        },
        "available_sources": [
            "BRL"
        ],
        "bitcoin": {
            "blockchain_info": {
                "name": "Blockchain.info",
                "format": [
                    "USD",
                    "en_US"
                ],
                "last": 29998.83,
                "buy": 29998.83,
                "sell": 29998.83,
                "variation": 0.589
            },
            "coinbase": {
                "name": "Coinbase",
                "format": [
                    "USD",
                    "en_US"
                ],
                "last": 30003.875,
                "variation": 0.594
            },
            "bitstamp": {
                "name": "BitStamp",
                "format": [
                    "USD",
                    "en_US"
                ],
                "last": 30028.0,
                "buy": 30025.0,
                "sell": 30023.0,
                "variation": 0.66
            },
            "foxbit": {
                "name": "FoxBit",
                "format": [
                    "BRL",
                    "pt_BR"
                ],
                "last": 144490.4076,
                "variation": 0.151
            },
            "mercadobitcoin": {
                "name": "Mercado Bitcoin",
                "format": [
                    "BRL",
                    "pt_BR"
                ],
                "last": 144422.74992067,
                "buy": 144383.73111209,
                "sell": 144530.85997759,
                "variation": 0.176
            }
        },
        "taxes": [
            {
                "date": "2023-07-17",
                "cdi": 13.75,
                "selic": 13.75,
                "daily_factor": 1.00050788,
                "selic_daily": 13.65,
                "cdi_daily": 13.65
            }
        ]
    },
    "execution_time": 0.0,
    "from_cache": true
}
""";