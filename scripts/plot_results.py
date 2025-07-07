import matplotlib.pyplot as plt
import pandas as pd

N = 26
a = 2/(N+1)
SCALE = 2**16

# df_og -> original dates and float values
# df_test_vector -> exp moving avg float values (same dates)
df_og = pd.read_csv('scripts/csv/aapl_prices.csv', parse_dates=['date'])
df_test_vector = pd.read_csv('scripts/csv/test_vectors.csv')

# set dates to be the same
df_test_vector['date'] = df_og['date'].reset_index(drop=True)

# calc then set the reference exp moving avg to the 'perfect ema' at each price
df_og['ema_ref'] = df_og['price'].ewm(alpha=a, adjust=False).mean()
df_test_vector['ema_ref'] = df_og['ema_ref'].reset_index(drop = True)

# scale/ convert to pu the exp moving avg to calc ema error
df_test_vector['ema_fixed_point'] = df_test_vector['ema'] / SCALE

df_test_vector['ema_error'] = df_test_vector['ema_fixed_point'] - df_og['ema_ref']

plt.plot(df_test_vector['date'], df_og['price'], label='og price')
plt.plot(df_test_vector['date'], df_test_vector['ema_fixed_point'], label = 'ema fixed point (hardware sim)')
plt.xlabel('date')
plt.ylabel('USD')
plt.legend()
plt.show()

plt.plot(df_test_vector['date'], df_test_vector['ema_error'], label = 'ema error')
plt.axhline(+0.01, color='k', ls='--')
plt.axhline(-0.01, color='k', ls='--')
plt.xlabel('date')
plt.ylabel('error (USD)')
plt.legend()
plt.show()


