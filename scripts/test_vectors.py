import pandas as pd

F = 16

def make_fixed(x: float) -> int:
    return int(round(x * 2**F))

# hardware vector output sim
def test_vec_params(input_csv: str, output_csv: str) -> None:

    df_og = pd.read_csv(input_csv, parse_dates=['date'])
    prices = df_og['price'].tolist()

    N = 26
    a = 2/(N+1)
    a_int = int(round(a*2**F))
    one_minus_a = (2**F - a_int) 
    half_lsb = 1 << (F-1)
    
    rows = []
    ema_prev = make_fixed(prices[0])
    rows.append({'idx':0,'price':make_fixed(prices[0]),'ema':ema_prev})

    for idx, price in enumerate(prices[1:], start=1):
            p_int = make_fixed(price)
            ema_curr = ((a_int * p_int + one_minus_a * ema_prev) + (half_lsb)) >> F
            ema_prev = (ema_curr)    
            rows.append({'idx':idx,'price':p_int,'ema':ema_curr})

    df_test_vector = pd.DataFrame(rows)
    df_test_vector.to_csv(output_csv, index = False)

def main():
    test_vec_params(
        input_csv = 'scripts/csv/aapl_prices.csv',
        output_csv = 'scripts/csv/test_vectors.csv'
    )

if __name__ == "__main__":
    main()
        
