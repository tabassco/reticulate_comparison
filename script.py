import pandas as pd
import numpy as np
import pyarrow as pa


class TestGenerator:
    def __init__(self, size: int) -> None:
        self._size = size
        self._df = None
        self._arrow = None
        
    def generate_dummies(self) -> None:
        self._df = pd.DataFrame(np.random.randint(0,100,size=(self._size, 20)))

        self._arrow = pa.Table.from_pandas(self._df)

    def get_sample_df(self) -> pd.DataFrame:
        return self._df

    def get_sample_arrow(self) -> pa.Table:
        return self._arrow