# Bond Calculator
1. Calculate the yield spread (return) between a corporate bond and its government bond benchmark.
2. Calculate the spread to the government bond curve.

## Usage
ruby run.rb

### Result Sample
```
  # CHALLENGE 1
  # Single yield spread calculation:
  "C1,G1,1.6%"
  "C2,G2,1.5%"
  "C3,G3,2.0%"
  "C4,G3,2.9%"
  "C5,G4,0.9%"
  "C6,G5,1.8%"
  "C7,G6,2.5%"

  # CHALLENGE 2
  # Spread to curve calculation for given corporate bond:
  "C1,1.43%"
  "C2,1.63%"
  "C3,2.47%"
  "C4,2.27%"
  "C5,1.9%"
  "C6,1.22%"
  "C7,2.83%"
```

## Files and Functions
### Functions
* Read file from sample data *csv*
* Calculate with *caulate_gov_bond_benchmark* , *caulate_spread_gov_bond_curve* and convert result to *Array* to output

### Files
```
-- /data (sample data contain folder)
-- /spec (uint test files folder)
-- bond.rb (Bond Calculator object)
-- Gemfile (Gem list)
-- run.rb  (Result output)
```

## Improvement
1. Add error check handler to check error during the read file and check data element
2. Make mutli-format output adapter
3. Make Bond as OpenStruct or object to store data
4. Gemfiy lineor interpolate
