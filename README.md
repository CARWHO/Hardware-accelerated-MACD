# MACD (Moving average convergence/ divergence) Indicator. Useful for entry point indentification.
MACD = 12-period EMA (fast EMA) - 26-period EMA (slow EMA). 

## Exponential Moving Average (EMA)  
The EMA is a recursive filter that smooths price data:  
\[
\text{EMA}[n] = \alpha\cdot \text{price}[n] + (1-\alpha)\cdot \text{EMA}[n-1],
\]  
where \(\alpha\) is the smoothing factor.

## Design decisions I made (implemented in test_vectors.py):
- Fractional split of Q16.16. This makes senes for the chosen stock and gives a reasonable resolution of 1/2^16 = 1.5*10^-5 USD. This is considered good enough because this error (0.0006 USD) << the market tick size of AAPL (0.01 USD).  
- Half LSB. A half LSB was added to avoid rounding down error
- alpha = 2/(N-1). Standard smoothing factor, good for data we are using.

The plotting program is used to understand whether the EMA logic is valid by looking for large deviations between the simulated hardware (Fixed point EMA) and the ideal floating point EMA.
