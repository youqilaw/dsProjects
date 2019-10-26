int FindPrime(int Range)
{
	int Flag;
	for (int i = 2; i < Range; i++)
	{
		Flag=0;
		for (int j = 2; j < i-1; j++)
		{
			if (i%j==0)
			{
				Flag=Flag+1;
			}
		}
		if (Flag==0)
		{
			cout<<i<<endl;
		}
	}
	return 0;
}