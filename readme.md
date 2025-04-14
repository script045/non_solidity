# M47: Part 10 Solidity
## M47.2 Data Location Rules & Guidelines


### Data Location Assignment Rules
- Storage to Storage -> Reference copy hoi
- Storage to Memory -> Full data copy hoi
- Memory to Storage -> Full Data copy hoi
- Memory to Memory -> Full data copy hoi(Deep copy)
- calldata to others location -> expensive, onek gas kharoch hobe

### Guidelines
1. State variables -> in Storage
2. External function e -> calldata
3. Storage reference er janno storage keyword use korbo
4. Memory array er jonno purbei allocate kore dibo
5. Memory allocate korbo -> gas fee concern thakbo

