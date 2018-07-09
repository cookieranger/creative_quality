import React, { Component } from "react";
import CreativeQualityCard from "./CreativeQualityCard";

export const createQualitySorter = (sortBy, order = "asc") => {
  return (qualityA, qualityB) => {
    if (qualityA[sortBy] > qualityB[sortBy]) {
      return order === "asc" ? 1 : -1;
    } else if (qualityA[sortBy] < qualityB[sortBy]) {
      return order === "asc" ? -1 : 1;
    } else {
      return 0;
    }
  };
};

const inverseOrder = order => (order === "asc" ? "desc" : "asc");

class App extends Component {
  constructor(props) {
    super(props);
    this.state = { sortBy: "name", order: "asc" };
  }

  createSortByUpdater(newSortBy) {
    return () => {
      const { sortBy: existingSortBy, order: existingOrder } = this.state;
      this.setState({
        sortBy: newSortBy,
        order:
          newSortBy === existingSortBy ? inverseOrder(existingOrder) : "asc"
      });
    };
  }

  render() {
    const { sortBy, order } = this.state;
    return (
      <div>
        <div style={{ display: "flex" }}>
          <button
            style={{ marginLeft: "auto" }}
            onClick={() => this.createSortByUpdater("final_score")()}
          >
            Sort by score
          </button>
          <button onClick={this.createSortByUpdater("name")}>
            Sort by name
          </button>
        </div>

        <div className="row">
          <div className="col-md-12">
            <h2 className="center uppercase bold" style={{ marginBottom: 20 }}>
              Creative Qualities
            </h2>
          </div>
        </div>

        <div className="row">
          <div className="col-md-12">
            <div className="row">
              {window.qualsJSON
                .sort(createQualitySorter(sortBy, order))
                .map(creativeQuality => (
                  <CreativeQualityCard
                    creativeQuality={creativeQuality}
                    key={creativeQuality.id}
                  />
                ))}
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
