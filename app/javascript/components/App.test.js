import { createQualitySorter } from "./App";
describe("createQualitySorter", () => {
  let items;
  const charlie = { name: "charlie", age: 22 };
  const bob = { name: "bob", age: 18 };
  const jean = { name: "jean", age: 7 };
  beforeEach(() => {
    items = [charlie, bob, jean];
  });
  it("can sort by attribute (default order: 'asc')", () => {
    expect(items.sort(createQualitySorter("name"))).toEqual([
      bob,
      charlie,
      jean
    ]);
    expect(items.sort(createQualitySorter("age"))).toEqual([
      jean,
      bob,
      charlie
    ]);
  });

  it("can order by `order`<asc, desc>", () => {
    expect(items.sort(createQualitySorter("name", "desc"))).toEqual([
      jean,
      charlie,
      bob
    ]);
    expect(items.sort(createQualitySorter("age", "desc"))).toEqual([
      charlie,
      bob,
      jean
    ]);
  });
});
