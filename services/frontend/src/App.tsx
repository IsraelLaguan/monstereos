import * as React from "react"
import { Switch} from "react-router-dom"

// import TopMenu from "./modules/shared/TopMenu"
// import HomeScreen from "./modules/pages/HomeScreen"
// import RankScreen from "./modules/pages/RankScreen"
// import AboutScreen from "./modules/pages/AboutScreen"
// import FaqScreen from "./modules/pages/FaqScreen"

// import "bulma"
import "bulma/css/bulma.css"
import "./styles/index.css"
import "./styles/home.css"

import Footer from "./modules/interface/Footer"
import Head from "./modules/interface/Head"
import Body from "./modules/interface/body"
// import Footer from "./modules/shared/Footer"
// import MyMonstersScreen from "./modules/pages/MyMonstersScreen"
// import MonsterDetailsScreen from "./modules/pages/MonsterDetailsScreen"

class App extends React.Component<{}, {}> {
  public render() {
    return (
      <Switch >
        <React.Fragment>
          {/* <TopMenu />
          <Route path="/" exact component={HomeScreen} />
          <Route path="/my-monsters" exact component={MyMonstersScreen} />
          <Route path="/monster/:id" component={MonsterDetailsScreen} />
          <Route path="/rank" exact component={RankScreen} />
          <Route path="/about" exact component={AboutScreen} />
          <Route path="/faq" exact component={FaqScreen} />
          <Footer /> */}
          <div style={{minHeight: "100vh", width: "90%", marginLeft: "5%"}}>
            <div style={{minHeight: "100vh", width: "100%", paddingTop: "10px"}}>
              <Head/>
              <Body />
            </div>
            <Footer />
          </div>
        </React.Fragment>
      </Switch>
    )
  }
}

export default App